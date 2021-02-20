List<QuizScoresModel> quizScoresData() {
  List<QuizScoresModel> list = List<QuizScoresModel>();
  QuizScoresModel model1 = QuizScoresModel();
  model1.title = "Membership";
  model1.id = 1;
  model1.img = 'assets/images/membership.png';
  QuizScoresModel model2 = QuizScoresModel();
  model2.title = "Measurements";
  model2.id = 2;
  model2.img = 'assets/images/measurement.png';
  QuizScoresModel model3 = QuizScoresModel();
  model3.title = "Accounts";
  model3.id = 3;
  model3.img = 'assets/images/transaction.png';
  QuizScoresModel model4 = QuizScoresModel();
  model4.title = "Attendance";
  model4.id = 4;
  model4.img = 'assets/images/attendance.png';
  QuizScoresModel model5 = QuizScoresModel();
  model5.title = "Change Password";
  model5.id = 5;
  model5.img = 'assets/images/password.png';
  QuizScoresModel model6 = QuizScoresModel();
  model6.title = "Logout";
  model6.id = 6;
  model6.img = 'assets/images/logout.png';
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model6);
  return list;
}





class QuizScoresModel {
  int id;
  var title = "";
  var img = "";
}





