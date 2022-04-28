class Server {
  static const protocol = "http://";
  //static const host = "ec2-34-207-65-236.compute-1.amazonaws.com:81";
  //static const host = "8c2c-177-222-123-18.sa.ngrok.io";
  static const host = "192.168.101.161:8080";
  static const baseEndpoint = "/app/api";

  // static const protocol = " http://";
  // static const host = "10.0.2.2";
  // // static const host = "10.0.3.2:8086";
  // static const baseEndpoint = "/backend/app/api";
  static const url = "$protocol$host$baseEndpoint";

  static const Map<String, int> RoleCodes = {
    'ADMIN': 1,
    'CLIENT': 2,
    'OWNER': 3,
    'DRIVER': 4
  };

  static const Map<String, String> SignUpType = {
    'GOOGLE': 'go',
    'FACEBOOK': 'fb',
    'EMAIL': 'em',
  };
}
