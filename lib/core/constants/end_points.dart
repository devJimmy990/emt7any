class EndPoints {
  static const String login = 'api/v1/auth/login';

  static const String me = 'api/v1/me';

  static const String studentDashboard = 'api/v1/student/dashboard';

  static const String getExam = "api/v1/student/available-exam";

  static const String submitAnswers = "api/v1/student/exam/submit";
}

/**
 * 
POST - api/v1/admin/create-school-admin
POST - api/v1/admin/create-student
POST - api/v1/admin/create-teacher

POST - api/v1/auth/login
POST - api/v1/logout
GET - api/v1/me

GET - api/v1/student/dashboard
GET - api/v1/teacher/dashboard

GET - sanctum/csrf-cookie
GET - /
GET - api/health
GET - up

 */
