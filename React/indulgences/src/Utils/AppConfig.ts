class AppConfig {
	public readonly Enumerate_Vacations = "http://localhost:8000/api/stats/enumerate_vacations/"
    public readonly Total_Users = "http://localhost:8000/api/stats/total_users/"
    public readonly Total_Likes = "http://localhost:8000/api/stats/total_likes/"
    public readonly Likes_Mapping = "http://localhost:8000/api/stats/likes_mapping/"
    public readonly Login_TokenUrl = "http://localhost:8000/api/token/"
    public readonly User_DetailsUrl = "http://localhost:8000/api/auth/user_details/"
    public readonly Logout_Url = "http://localhost:8000/api/auth/logout/"
}

export const appConfig = new AppConfig();
