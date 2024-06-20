import 'package:century_mobile/domain/usecases/upload_payment_info.dart';
import 'package:century_mobile/presentation/cubit/payment_upload/payment_upload_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constant/color.dart';
import '../../domain/entities/unit.dart';
import '../widgets/components/_components.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentInfoScreen extends StatefulWidget {
  const PaymentInfoScreen({
    Key key,
    this.unit,
  }) : super(key: key);
  final UnitEntity unit;

  @override
  _PaymentInfoScreenState createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  bool isAgreed = false;
  PlatformFile idFile;
  PlatformFile proofFile;
  TextEditingController fNameController;
  TextEditingController lNameController;
  TextEditingController mNameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController agentsEmailController;
  TextEditingController validIDController;
  TextEditingController proofController;

  @override
  void initState() {
    super.initState();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    mNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    agentsEmailController = TextEditingController();
    validIDController = TextEditingController();
    proofController = TextEditingController();
    proofFile = PlatformFile();
    idFile = PlatformFile();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   actions: [
      //     Container(
      //       margin: EdgeInsets.only(right: 10),
      //       child: CircleAvatar(
      //         backgroundColor: CPColors.darkGrey,
      //         radius: 22,
      //         child: CircleAvatar(
      //           radius: 20,
      //           backgroundImage: AssetImage('images/user_icon.png'),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  // UnitDetails(unit: widget.unit),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextLato(
                          'BUYER\'S INFORMATION',
                          size: 10.0.sp,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'First name',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: TextField(
                            onEditingComplete: () {
                              node.nextFocus();
                            },
                            controller: fNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'Middle Name',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: TextField(
                            onEditingComplete: () {
                              node.nextFocus();
                            },
                            controller: mNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'Last name',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: TextField(
                            onEditingComplete: () {
                              node.nextFocus();
                            },
                            controller: lNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'Email',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: TextField(
                            onEditingComplete: () {
                              node.nextFocus();
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'Mobile number',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: TextField(
                            onEditingComplete: () {
                              node.nextFocus();
                            },
                            controller: phoneController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'Agent\'s Email Address',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: TextField(
                            onEditingComplete: () {
                              node.unfocus();
                            },
                            controller: agentsEmailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'Buyer\'s Valid ID',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: validIDController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    labelText: proofFile.name ?? 'Choose file',
                                    labelStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        bottomLeft: Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  FilePickerResult result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    proofFile = result.files.first;
                                  }

                                  setState(() {});
                                },
                                child: Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0XFFeaebef),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4),
                                      ),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.7))),
                                  child: CustomTextLato('Browse',
                                      color: Color(0XFF7b818c),
                                      weight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'Proof of Payment',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: proofController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    labelText: idFile.name ?? 'Choose file',
                                    labelStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        bottomLeft: Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  FilePickerResult result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    idFile = result.files.first;
                                    print('ID FILE : ${idFile.path}');
                                  }

                                  setState(() {});
                                },
                                child: Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0XFFeaebef),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4),
                                      ),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.7))),
                                  child: CustomTextLato('Browse',
                                      color: Color(0XFF7b818c),
                                      weight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: isAgreed,
                                onChanged: (value) {
                                  setState(() {
                                    isAgreed = value;
                                  });
                                },
                              ),
                              Expanded(
                                child: CustomTextLato(
                                  'By ticking this boo,you have completely read and agreed to the Privacy Policy contained in this consent form.',
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomButtonText(
                          'SUBMIT',
                          onTap: () {
                            if (isAgreed) {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return BlocConsumer(
                                      cubit: context.read<PaymentUploadCubit>(),
                                      listener: (ctx1, state) {
                                        if (state is PaymentUploadSuccess) {
                                          Navigator.popUntil(context,
                                              (route) => route.isFirst);
                                        }
                                      },
                                      builder: (ctx1, state) {
                                        if (state is PaymentUploadLoading) {
                                          return AlertDialog(
                                            content: SizedBox(
                                              width: 150,
                                              height: 200,
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            ),
                                          );
                                        } else if (state
                                            is PaymentUploadSuccess) {
                                          return AlertDialog(
                                            content: SizedBox(
                                              width: 150,
                                              height: 200,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .checkCircle,
                                                    size: 64,
                                                    color: Colors.green,
                                                  ),
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  CustomTextLato(
                                                    'Your reservation has been saved',
                                                    color: Colors.green,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                        return AlertDialog(
                                          title:
                                              CustomTextLato('Are you sure?'),
                                          content: CustomTextLato(
                                              'You are going to exit the application'),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(ctx).pop(false),
                                              child: CustomTextLato('NO'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                context
                                                    .read<PaymentUploadCubit>()
                                                    .upload(
                                                        email: emailController
                                                            .text,
                                                        agentEmail:
                                                            agentsEmailController
                                                                .text,
                                                        firstName:
                                                            fNameController
                                                                .text,
                                                        middleName:
                                                            mNameController
                                                                .text,
                                                        lastName: lNameController
                                                            .text,
                                                        mobileNumber:
                                                            phoneController
                                                                .text,
                                                        proofOfPayment:
                                                            idFile.path,
                                                        scheduleURL: widget.unit
                                                            .apiScheduleBaseURL,
                                                        validId:
                                                            proofFile.path);
                                              },
                                              child: CustomTextLato(
                                                'YES',
                                                color: CPColors.green,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.white,
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomTextLato(
                                              'Please tick the checkbox'),
                                        ],
                                      )));
                            }
                          },
                          color: CPColors.green,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButtonBack(),
        ],
      ),
    );
  }
}
