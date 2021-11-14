class Server {
  // static const url = "https://taxi-segurito.herokuapp.com/api/";
  // static const urlLocal =
  //     "http://10.0.2.2:8070/PHP_TAXISEGURITIO/taxi-segurito-backend/app/api/";

  static const protocol = "http://";
  static const host = "4291-186-2-95-181.ngrok.io";
  // static const host = "10.0.3.2:8086";
  static const baseEndpoint = "/app/api";
  /* static const host = "192.168.0.18"; //static const host = "637e-161-138-17-0.ngrok.io"; 
  static const baseEndpoint = "/taxisegu/app/api";*/ //static const baseEndpoint = "/app/api/";
  static const url = "$protocol$host$baseEndpoint";

  static const Map<String, int> RoleCodes = {
    'ADMIN': 1,
    'CLIENT': 2,
    'OWNER': 3,
  };

  static const Map<String, String> SignUpType = {
    'GOOGLE': 'go',
    'FACEBOOK': 'fb',
    'EMAIL': 'em',
  };
}
