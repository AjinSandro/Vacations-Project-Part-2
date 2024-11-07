
import css from "./Vacations.module.css";
import { useEffect, useMemo, useState } from "react";
import AuthGuard from "../../AuthGuard";
import axios from "axios";
import { appConfig } from "../../../Utils/AppConfig";
import { Chart } from "react-google-charts";

interface Stats {
    VacationEnumeration:{
        past_vacations: number,
        on_going_vacations: number,
        future_vacations: number
    }
    TotalUsers:{total_users: number}
    TotalLikes:{total_likes: number}
    LikesMapping:[{destination: string, likes: number}]
}

function Vacations(): JSX.Element {
    

    const [stats,setStats] = useState<Stats | undefined>(undefined)
    useEffect(() => {

        const fetchStatistics = async () => {
            const promises = [
                axios.get(appConfig.Enumerate_Vacations),
                axios.get(appConfig.Total_Users),
                axios.get(appConfig.Total_Likes),
                axios.get(appConfig.Likes_Mapping),
            ]
            const [
                {data : VacationEnumeration}, 
                {data: TotalUsers}, 
                {data: TotalLikes},
                {data: LikesMapping}
            ] = await Promise.all(promises)
            setStats({VacationEnumeration, TotalLikes, TotalUsers, LikesMapping})
        }
        fetchStatistics()
    },[])

    useEffect(() => {
        if(stats) {
            console.log(stats)
        }
    },[stats])

    const VacationLikeMappingData = useMemo(() => {
        if(!stats) return []

        return [
        ["Vacation", "Likes"],
        ...stats.LikesMapping.map(m => ([m.destination,m.likes]))
      ]}, [stats]);

      const VacationEnumerationData = useMemo(() => {
        if(!stats) return []
        return [
            ["Vacation timeline", "Vacations"],
            ...Object.entries(stats.VacationEnumeration).map((entry) => ([entry[0].replaceAll("_", " "), entry[1]]))
          ]
      },[stats])

      if(!stats) {
        return <div>Loading...</div>
      }
    return (
        <div className={css.Vacations}>
            <hr style={{margin:'1rem'}}/>
            <div style={{display:'flex', gap:'1rem', alignItems:'center',width:'fit-content',marginInline:'auto'}}>
                <h3>Total Users: {stats.TotalUsers.total_users}</h3>
                <span style={{fontSize:30,marginBottom:10}}>|</span>
                <h3>Total Likes: {stats.TotalLikes.total_likes}</h3>
            </div>
            <hr style={{margin:'1rem'}}/>
            <br/><br/>
            <h1>Vacation Likes mapping:</h1>
            <Chart chartType="ColumnChart" 
            style={{marginInline:'auto'}}
            options={{
                chartArea: { width: '73%', height: '69%' }, // Adjust these values
              }}
            width="600px" height="100%" data={VacationLikeMappingData} />
            <br/><br/>
            <hr style={{margin:'1rem'}}/>
            <br/><br/>
            <h1>Vacation Time-lines:</h1>
            <Chart chartType="ColumnChart" 
            style={{marginInline:'auto'}}
            options={{
                chartArea: { width: '50%', height: '70%' }, // Adjust these values
              }}
            width="800px" height="100%" data={VacationEnumerationData} />
    
        </div>
    );
}

export default AuthGuard(Vacations)
