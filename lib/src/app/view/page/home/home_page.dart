// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_repository/src/app/bloc/menu_fp/menu_bloc.dart';
import 'package:flutter_repository/src/app/bloc/menu_project/menu_project_bloc.dart';
import 'package:flutter_repository/src/app/model/user_respository.dart';
import 'package:flutter_repository/src/app/view/page/profile/profile_page.dart';
import 'package:flutter_repository/src/app/view/widget/camel_case.dart';
import 'package:flutter_repository/src/app/view/widget/my_card.dart';
import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<ProjectCageQueryBloc>(
        //   create: (_) => ProjectCageQueryBloc()..add(ProjectCageQueryGet()),
        // ),
        BlocProvider<MenuProjectBloc>(
          create: (_) => MenuProjectBloc(),
        ),
        BlocProvider<MenuBloc>(
          create: (_) => MenuBloc(),
        ),
        // BlocProvider<TaskQueryBloc>(
        //   create: (_) => TaskQueryBloc()..add(TaskQueryGet()),
        // ),
      ],
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: primaryColor,
        centerTitle: false,
        title: InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const UserListPage(),
            //   ),
            // );
            // Navigator.push(
            //   context,
            //   UserListPage.route(),
            // );
          },
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                ProfilePage.route(),
              );
            },
            child: Text(
              userRepository.user.name.toTitleCase(),
              style: const TextStyle(fontFamily: 'Montserrat', color: whiteColor, fontSize: 15),
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a Profile')),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'asset/img/profile_photo.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.description, color: whiteColor),
            tooltip: 'Recording',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a Recording')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: whiteColor),
            tooltip: 'Notifications',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a Notifications')),
              );
            },
          ),
        ],
      ),
      body: MyCard(
        height: MediaQuery.of(context).size.height,
        child: ColoredBox(
          color: whiteColor,
          child: Stack(
            children: [
              Container(
                height: 135.3,
                color: primaryColor,
              ),
              // const ProjectList(),
            ],
          ),
        ),
      ),
    );
  }
}

final PageController _controllerProject = PageController();

// class PageViewProject extends StatelessWidget {
//   const PageViewProject({
//     super.key,
//     required this.project,
//   });
//   final List<ProjectCage> project;
//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: _controllerProject,
//       onPageChanged: (index) {
//         context.read<MenuProjectBloc>().add(MenuProjectSwitch(index));
//       },
//       children: List.generate(project.length + 1, (index) {
//         if (index == project.length) {
//           return const CreateProject();
//         } else {
//           final projectData = project[index];
//           return ListView(
//             children: [
//               Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   // ProjectTitle(project: projectData),
//                   //CageList.prepare(projectData),
//                   Column(
//                     children: [
//                       const SizedBox(height: 15),
//                       // CageListTile(projectCage: project[index]),
//                       const SizedBox(height: 8),
//                       IndexPresentation(
//                         projectCage: project[index],
//                       ),
//                       const SizedBox(height: 15),
//                       SensorList.prepare(project[index].cageId),
//                       const SizedBox(height: 15),
//                       const Estimation(),
//                       const SizedBox(height: 15),
//                     ],
//                   )
//                 ],
//               ),
//             ],
//           );
//         }
//       }),
//     );
//   }
// }

// class ProjectList extends StatelessWidget {
//   const ProjectList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProjectCageQueryBloc, ProjectCageQueryState>(
//       builder: (context, state) {
//         if (state.status.isInProgress) {
//           return const ProjectShimmer();
//         }
//         if (state.status.isFailure) {
//           return const SomethingWrong();
//         }
//         return Container(
//           height: 750,
//           color: Colors.transparent,
//           child: Stack(
//             children: [
//               PageViewProject(project: state.projectCage),
//               NextProjectButton(totalPageProject: state.projectCage.length),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class CreateProject extends StatelessWidget {
  const CreateProject({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 45),
        Column(
          children: [
            MyCard(
              onTap: () {
                // Navigator.push(
                //   context,
                //   ProjectCreateEditPage.route(),
                // ).then((success) {
                //   if (success ?? false) {
                //     context.read<ProjectQueryBloc>().add(
                //           ProjectQueryGet(),
                //         );
                //   }
                // });
              },
              width: MediaQuery.of(context).size.width,
              height: 160,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/img/add.png', width: 48),
                  const SizedBox(height: 20),
                  const Text(
                    'Create Project',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class NextProjectButton extends StatelessWidget {
  const NextProjectButton({
    super.key,
    required this.totalPageProject,
  });

  final int totalPageProject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<MenuProjectBloc, MenuProjectState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context.read<MenuBloc>().add(MenuSwitchReset(0));
                    context.read<MenuProjectBloc>().add(MenuProjectPrev(state.index));
                    _controllerProject.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: state.index <= 0
                      ? const SizedBox()
                      : Container(
                          width: 25,
                          height: 80,
                          padding: const EdgeInsets.only(right: 2),
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            color: whiteColor,
                          ),
                        ),
                ),
                InkWell(
                  onTap: () {
                    context.read<MenuBloc>().add(MenuSwitchReset(-1));
                    context.read<MenuProjectBloc>().add(MenuProjectNext(state.index));
                    _controllerProject.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                    context.read<MenuBloc>().add(MenuNext(1));
                  },
                  child: state.index >= totalPageProject
                      ? const SizedBox()
                      : Container(
                          width: 25,
                          height: 80,
                          padding: const EdgeInsets.only(left: 2),
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                            color: whiteColor,
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

//final PageController _controllerCage = PageController();

// class NextPrevCageButton extends StatelessWidget {
//   const NextPrevCageButton({
//     super.key,
//     required this.totalPage,
//   });

//   final int totalPage;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       child: Column(
//         children: [
//           const SizedBox(height: 79),
//           BlocBuilder<MenuBloc, MenuState>(
//             builder: (context, state) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       // ignore: avoid_print
//                       print(state.index);
//                       context.read<MenuBloc>().add(MenuPrevious(state.index));
//                       _controllerCage.previousPage(
//                         duration: const Duration(milliseconds: 400),
//                         curve: Curves.easeInOut,
//                       );
//                     },
//                     child: state.index <= 0
//                         ? const SizedBox()
//                         : Container(
//                             width: 36,
//                             height: 36,
//                             decoration: const BoxDecoration(
//                               color: primaryColor,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.chevron_left,
//                               color: whiteColor,
//                             ),
//                           ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       context.read<MenuBloc>().add(MenuNext(state.index));
//                       _controllerCage.nextPage(
//                         duration: const Duration(milliseconds: 400),
//                         curve: Curves.easeInOut,
//                       );
//                     },
//                     child: state.index >= totalPage - 1
//                         ? const SizedBox()
//                         : Container(
//                             width: 36,
//                             height: 36,
//                             decoration: const BoxDecoration(
//                               color: primaryColor,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.chevron_right,
//                               color: whiteColor,
//                             ),
//                           ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SensorList extends StatelessWidget {
//   const SensorList({super.key});

//   static Widget prepare(int cageId) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<CageSensorDetailBloc>(
//           create: (context) => CageSensorDetailBloc()..add(CageSensorDetailGet(id: cageId)),
//         ),
//       ],
//       // cage: cage
//       child: const SensorList(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CageSensorDetailBloc, CageSensorDetailState>(
//       builder: (context, state) {
//         if (state.status.isInProgress) {
//           return const SensorShimmer();
//         }
//         if (state.status.isFailure) {
//           return const SomethingWrong();
//         }
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Wrap(
//               children: List.generate(state.cageSensorDetail.length, (index) {
//                 final sensor = state.cageSensorDetail[index];
//                 return SensorTile(sensor: sensor);
//               }),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

class Estimation extends StatelessWidget {
  const Estimation({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      onTap: () {},
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/img/estimasi.png',
                width: 40,
              ),
            ],
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Detail Estimasi Biaya',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 14),
              ),
              SizedBox(height: 10),
              Text(
                'Click For Detail',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
