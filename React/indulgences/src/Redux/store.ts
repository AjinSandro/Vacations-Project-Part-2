import { configureStore } from "@reduxjs/toolkit"
import { userReducer, UserStore } from "./users/userSlice"

export type AppState = {
    userStore:UserStore
}
export const store = configureStore<AppState>
({
        reducer: {
             userStore: userReducer,
        } 
})
export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch