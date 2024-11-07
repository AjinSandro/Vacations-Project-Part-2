import {createSlice} from "@reduxjs/toolkit"
import { UserModel } from "../../Models/UserModel"
import {login, logout, userDetails} from "./userActions"



export type UserStore = {
    user: UserModel | null,
    token: string | null,
    refresh:string | null
    loading: boolean
    error: unknown
}


const userSlice = createSlice({
    name:"users",
    initialState:{
        user: null,
        token: localStorage.getItem('token'),
        refresh: localStorage.getItem('refresh'),
        loading: false,
        error: undefined
    } as UserStore,
    reducers: {},
    extraReducers: (builder) => {
      
        builder.addCase(login.pending, (state,action) => {
            state.loading = true
        })

        builder.addCase(login.fulfilled, (state,action) => {
            state.token = action.payload.access
            state.refresh = action.payload.refresh
            state.loading = false
            localStorage.setItem('token', action.payload.access)
            localStorage.setItem('refresh', action.payload.refresh)
        })
        builder.addCase(login.rejected, (state,action) => {
            state.loading = false
            state.error = action.error
        })
        
        builder.addCase(logout.pending, (state,action) => {
            state.loading = true
        })

        builder.addCase(logout.fulfilled, (state,action) => {
            state.loading = false
            state.user = null
            state.refresh = null
            state.token = null
            localStorage.removeItem('token')
            localStorage.removeItem('refresh')
        })

        builder.addCase(logout.rejected, (state,action) => {
            state.loading = false
            state.error = action.error
        })


        builder.addCase(userDetails.pending, (state,action) => {
            state.loading = true
        })

        builder.addCase(userDetails.fulfilled, (state,action) => {
            state.loading = false
            state.user = action.payload
        })

        builder.addCase(userDetails.rejected, (state,action) => {
            state.loading = false
            state.error = action.error
        })
    } 
})



export const userActions = userSlice.actions;
export const userReducer = userSlice.reducer; 
