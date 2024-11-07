import axios from "axios";
import {CredentialModel} from "../Models/CredentialModel"
import {UserModel} from "../Models/UserModel"
import {appConfig} from "../Utils//AppConfig"

class UserService {

    public async userDetails() : Promise<UserModel> {
        const response = await axios.get<UserModel>(appConfig.User_DetailsUrl)
        return response.data
    }
    public async login(credentials:CredentialModel): Promise<{
        access: string,
        refresh: string
    }>{
        const response = await axios.post<string>(appConfig.Login_TokenUrl, credentials)
        const token = response.data as any; 
        return token
    }

    public async logout(): Promise<void> {
        const response = await axios.post<void>(appConfig.Logout_Url)
        return response.data
    }

}

export const userService = new UserService();
