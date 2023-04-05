import 'package:get/get.dart';

import '../modules/aboutus/bindings/aboutus_binding.dart';
import '../modules/aboutus/views/aboutus_view.dart';
import '../modules/add_comment/bindings/add_comment_binding.dart';
import '../modules/add_comment/views/add_comment_view.dart';
import '../modules/chats/bindings/chats_binding.dart';
import '../modules/chats/views/chats_view.dart';
import '../modules/community/bindings/community_binding.dart';
import '../modules/community/views/health_record.dart';
import '../modules/consultation/bindings/consultation_binding.dart';
import '../modules/consultation/views/consultation_view.dart';
import '../modules/consultation_details/bindings/consultation_details_binding.dart';
import '../modules/consultation_details/views/consultation_details_view.dart';
import '../modules/create_group/bindings/create_group_binding.dart';
import '../modules/create_group/views/create_group_view.dart';
import '../modules/create_password/bindings/create_password_binding.dart';
import '../modules/create_password/views/create_password_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/favourites/bindings/favourites_binding.dart';
import '../modules/favourites/views/favourites_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otpverify/bindings/otpverify_binding.dart';
import '../modules/otpverify/views/otpverify_view.dart';
import '../modules/pg_details/bindings/pg_details_binding.dart';
import '../modules/pg_details/views/pg_details_view.dart';
import '../modules/privacy/bindings/privacy_binding.dart';
import '../modules/privacy/views/privacy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/study_preference/bindings/study_preference_binding.dart';
import '../modules/study_preference/views/study_preference_view.dart';
import '../modules/test_score/bindings/test_score_binding.dart';
import '../modules/test_score/views/test_score_view.dart';
import '../modules/trainer_details/bindings/trainer_details_binding.dart';
import '../modules/trainer_details/views/trainer_details_view.dart';
import '../modules/upload_prescription/bindings/ug_details_binding.dart';
import '../modules/upload_prescription/views/upload_prescription_screen.dart';
import '../modules/university_details/bindings/university_details_binding.dart';
import '../modules/university_details/views/university_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTPVERIFY,
      page: () => const OtpverifyView(),
      binding: OtpverifyBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.STUDY_PREFERENCE,
      page: () => const StudyPreferenceView(),
      binding: StudyPreferenceBinding(),
    ),
    GetPage(
      name: _Paths.UG_DETAILS,
      page: () => const UploadPrescriptionScreeen(),
      binding: UgDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PG_DETAILS,
      page: () => const PgDetailsView(),
      binding: PgDetailsBinding(),
    ),
    GetPage(
      name: _Paths.TEST_SCORE,
      page: () => const TestScoreView(),
      binding: TestScoreBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PASSWORD,
      page: () => const CreatePasswordView(),
      binding: CreatePasswordBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNITY,
      page: () => const HealthRecord(),
      binding: CommunityBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.TRAINER_DETAILS,
      page: () => const TrainerDetailsView(),
      binding: TrainerDetailsBinding(),
    ),
    GetPage(
      name: _Paths.UNIVERSITY_DETAILS,
      page: () => const UniversityDetailsView(),
      binding: UniversityDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_COMMENT,
      page: () => const AddCommentView(),
      binding: AddCommentBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_GROUP,
      page: () => const CreateGroupView(),
      binding: CreateGroupBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => const ChatsView(),
      binding: ChatsBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => const AboutusView(),
      binding: AboutusBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY,
      page: () => const PrivacyView(),
      binding: PrivacyBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITES,
      page: () => const FavouritesView(),
      binding: FavouritesBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION,
      page: () => const ConsultationView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION_DETAILS,
      page: () => const ConsultationDetailsView(),
      binding: ConsultationDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
  ];
}
