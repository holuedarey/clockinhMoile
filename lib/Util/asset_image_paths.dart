import 'dart:convert';
import 'dart:typed_data';

class AssetImagePaths {

  static const String fab = 'assets/fab.png';
  static const String tab3 = 'assets/images/tab3.png';
  static const String nigeria = 'assets/images/nigeria.png';
  static const String notification = 'assets/images/notification.png';
  static const String biometrics = 'assets/images/biometrics.png';
  static const String progressBar = 'assets/images/progress_bar.png';
  static const String progressBarII = 'assets/images/progress_two.png';
  static const String miniProgressBar = 'assets/images/mini_progress_bar.png';
  static const String blocks = 'assets/images/blocks.png';
  static const String block = 'assets/images/block.png';
  static const String book = 'assets/images/book.png';
  static const String flag = 'assets/images/flag.png';
  static const String car = 'assets/images/car.png';
  static const String ring = 'assets/images/ring.png';
  static const String laptop = 'assets/images/laptop.png';
  static const String giraffe = 'assets/images/giraffe.png';
  static const String fire = 'assets/images/fire.png';
  static const String mono = 'assets/images/mono.png';
  static const String monoBig = 'assets/images/mono_big.png';
  static const String badge1 = 'assets/images/badge1.png';
  static const String badge2 = 'assets/images/badge2.png';
  static const String badge3 = 'assets/images/badge3.png';
  static const String home = 'assets/images/home.png';
  static const String search = 'assets/images/todlrLearn.png';
  static const String bookmark = 'assets/images/bookmark.png';
  static const String target = 'assets/images/target.png';
  static const String user = 'assets/images/user.png';
  static const String userPlaceHolder = 'assets/images/user_place_holder.png';

  static const String file = 'assets/images/file.png';
  static const String todlrxmono = 'assets/images/todlrxmono.png';
  static const String notify = 'assets/images/notify.png';
  static const String documentIcon = 'assets/images/document_icon.png';
  static const String investorAnimation =
      'assets/images/investor_animation.gif';
  static const String bubblesAnimation = 'assets/images/bubbles_animation.gif';
  static const String animatedLoader = 'assets/images/loading_animation.json';
  static const String investorLoader = 'assets/images/investor_animation.gif';

  static const String spaceCraft = 'assets/images/space_craft.png';
  static const String sliderIcon = 'assets/images/slider_icon.png';
  static const String linkBankImage = 'assets/images/link_bank_image.png';
  static const String flutterwave = 'assets/images/flutterwave.png';
  static const String monoIcon = 'assets/images/mono_icon.png';
  static const String message = 'assets/images/message.png';
  static const String closeIcon = 'assets/images/close_icon.png';
  static const String roundCloseIcon = 'assets/images/round_close_icon.png';
  static const String securityLock = 'assets/images/security_lock.png';
  static const String imageUploadPlaceholder =
      'assets/images/photo_placeholder.png';
  static const String notePad = 'assets/images/notepad.png';
  static const String birthdayIcon = 'assets/images/birthday_icon.png';
  static const String piggyImage = 'assets/images/piggy_image.png';
  static const String piggyImageVariation = 'assets/images/piggy_variation.png';
  static const String calculatorIcon = 'assets/images/calculator_icon.png';
  static const String backIcon = 'assets/images/back.png';
  static const String bankIcon = 'assets/images/bank_icon.png';
  static const String faceId = 'assets/images/face_id.png';
  static const String warning = 'assets/images/warning.png';
  static const String spilledCream = 'assets/images/spilled_ice_cream.png';

  static const String contactUs = 'assets/images/contact_us_icon.png';
  static const String editProfile = 'assets/images/edit_profile_icon.png';
  static const String legalIcon = 'assets/images/legal_icon.png';
  static const String planIcon = 'assets/images/plan_icon.png';
  static const String referralIcon = 'assets/images/referral_icon.png';
  static const String idVerification = 'assets/images/id_verification_icon.png';
  static const String securityProfile = 'assets/images/security_icon.png';
  static const String arrowVector = 'assets/images/arrow_vector.png';
  static const String privacyIcon = 'assets/images/privacy_icon.png';
  static const String passcodeKey = 'assets/images/passcode_key.png';
  static const String learnBackground = 'assets/images/learn_background.png';
  static const String kidsAvatar = 'assets/images/kids_avatar.png';
  static const String piggyVar = 'assets/images/piggy_var.png';
  static const String bigT = 'assets/images/big_t.png';
  static const String pinSetUp = 'assets/images/pin_setup.png';
  static const String flyChild = 'assets/images/fly_child.png';
  static const String loadMiniIcon = 'assets/images/load_mini_icon.png';
  static const String fireEmoji = 'assets/images/fire_emoji.png';
  static const String chatArrow = 'assets/images/chat_arrow.png';
  static const String bankAvatar = 'assets/images/bank_avatar_icon.png';
  static const String dangerIcon = 'assets/images/danger_icon.png';
  static const String ninjaIcon = 'assets/images/ninja_icon.png';

  static const String biometricsSecurity =
      'assets/images/biometrics_security.png';
  static const String logOut = 'assets/images/log_out.png';
  static const String confettiwhiteAnimation =
      'assets/images/confetti_white.gif';
  static const String cryingPiggy = 'assets/images/crying_piggy.png';
  static const String likeIcon = 'assets/images/like_icon.png';
  static const String shareIcon = 'assets/images/share_icon.png';
  static const String roundCheck = 'assets/round_check.png';

  static const String confettiAnimation = 'assets/images/confetti_color.gif';
  static const String typingAnimation = 'assets/images/typing_animation.json';
  static const String cloudUpload = 'assets/images/cloud_upload.png';
  static const String notificationActivity =
      'assets/images/notification_bell.png';
  static const String customerChat = 'assets/images/customer_chat.png';
  static const String editIcon = 'assets/images/icon_edit.png';
  static const String giftBox = 'assets/images/gift_box.png';

  Uint8List imageBase64Converter(String base64ImageString) {
    var image = base64Decode(
        base64ImageString.replaceAll("data:image/png;base64,", ""));
    return image;
  }

  String convertStringToUnicode(String content) {
    String regex = "\\u";
    int offset = content.indexOf(regex) + regex.length;
    while (offset > 1) {
      int limit = offset + 4;
      String str = content.substring(offset, limit);
      if (str.isNotEmpty) {
        String uni = String.fromCharCode(int.parse(str, radix: 16));
        content = content.replaceFirst(regex + str, uni);
      }
      offset = content.indexOf(regex) + regex.length;
    }
    return content;
  }
}
