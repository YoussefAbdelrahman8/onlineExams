/// code : ""
/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjNkODkwODZhMDI0ZjA2ZWEyN2MyZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQwMzM4OTkyfQ.k8AzlOsjhaoE_Mi9MvwlngULcesqbBWNXxokaiXypNs"

class LoginEntity {
  LoginEntity({
      this.code, 
      this.message, 
      this.token,});


  String? code;
  String? message;
  String? token;


}