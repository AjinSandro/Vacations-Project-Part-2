import { createAsyncThunk, PayloadAction } from "@reduxjs/toolkit"
import { userService } from "../../Services/UserServices";
import { CredentialModel } from "../../Models/CredentialModel";



export const login = createAsyncThunk("users/login", async (credentialModel: CredentialModel) => {
    const token = await userService.login(credentialModel)
    return token
})

export const logout = createAsyncThunk("users/logout", async () => {
})


export const userDetails = createAsyncThunk("users/userDetails", async () => {
    const user = await userService.userDetails()
    return user
})

