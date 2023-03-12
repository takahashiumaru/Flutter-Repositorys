import 'package:flutter_repository/src/app/bloc/users_delete/users_delete_bloc.dart';
import 'package:flutter_repository/src/app/bloc/users_query/users_query_bloc.dart';
import 'package:flutter_repository/src/app/util/toast.dart';
import 'package:flutter_repository/src/app/view/widget/please_wait.dart';
import 'package:flutter_repository/src/app/model/users.dart';
import 'package:flutter_repository/src/app/view/widget/something_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_repository/src/app/view/widget/button.dart';
import 'package:flutter_repository/src/app/view/widget/popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key, this.userListPage});
  static Widget prepare({UserListPage? userListPage}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserQueryBloc>(
          create: (_) => UserQueryBloc()..add(UserQueryGet()),
        ),
        BlocProvider<UsersDeleteBloc>(
          create: (_) => UsersDeleteBloc(),
        ),
      ],
      child: UserListPage(userListPage: userListPage),
    );
  }

  // static Route<void> route({UserListPage? userListPage}) {
  //   return MaterialPageRoute(
  //     builder: (context) => MultiBlocProvider(
  //       providers: [
  //         BlocProvider(
  //           create: (_) => UserQueryBloc()
  //             ..add(
  //               UserQueryGet(
  //                 id: 0,
  //                 name: '',
  //                 nip: '',
  //                 role: '',
  //                 joinDate: '',
  //                 phone: '',
  //                 email: '',
  //               ),
  //             ),
  //         ),
  //         BlocProvider(
  //           create: (_) => UserDeleteBloc(),
  //         ),
  //       ],
  //       child: UserListPage(userListPage: userListPage),
  //     ),
  //   );
  // }

  final UserListPage? userListPage;

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Product List');
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Users',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0XFF00A8E8),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: const Color(0XFF00A8E8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0XFFBFC4C7).withOpacity(0.2),
                        offset: const Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   DepletionCreate.route(),
                      // );
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                    color: Colors.white,
                  ),
                ),
                // const SizedBox(
                //   width: 24,
                // ),
                // //const Spacer(),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     right: 30,
                //   ),
                //   child: IconButton(
                //     // Create Api Product
                //     onPressed: () {
                //       // Navigator.push(context, ProductCreateEditPage.route())
                //       //     .then((success) {
                //       //   if (success ?? false) {
                //       //     context.read<UserQueryBloc>().add(
                //       //           UserQueryGet(),
                //       //         );
                //       //   }
                //       // });
                //     },
                //     // Create Api Product
                //     icon: const Icon(
                //       Icons.add,
                //     ),
                //     color: const Color(0XFF713933),
                //   ),
                // ),
              ],
            ),
            const Expanded(
              child: _List(),
            ),
          ],
        ),
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserQueryBloc, UserQueryState>(
      builder: (context, state) {
        if (state.status.isInProgress) {
          return const PleaseWait();
        }
        if (state.status.isFailure) {
          return const SomethingWrong();
        }
        return ListView.separated(
          itemCount: state.users.length,
          itemBuilder: (context, index) {
            final user = state.users[index];
            return UserListTile(
              user: user,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 0),
        );
      },
    );
  }
}

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
    this.onPressed,
  });

  final Users user;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersDeleteBloc, UsersDeleteState>(
      // Delete Api Product
      listener: (context, state) {
        if (state is UsersDeleteSuccess) {
          Toast(context).success('User Deleted Successfully');
          context.read<UserQueryBloc>().add(
                UserQueryGet(),
              );
        }
      },
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: 100,
                      child: Text(
                        user.role,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'Montserrat', color: Colors.black, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(
                      // padding: const EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          width: 100,
                          child: Text(
                            user.nip,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: 'Montserrat', color: Colors.black, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          width: 100,
                          child: Text(
                            user.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: 'Montserrat', color: Colors.black, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          child: EditButton(
                            onPressed: () {
                              // Navigator.push(context, CreateEmployee.route(user: user)).then((success) {
                              //   if (success ?? false) {
                              //     context.read<UserQueryBloc>().add(
                              //           UserQueryGet(),
                              //         );
                              //   }
                              // });
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      // padding: const EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          width: 100,
                          child: Text(
                            user.email,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: 'Montserrat', color: Colors.black, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          width: 100,
                          child: Text(
                            user.phone,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: 'Montserrat', color: Colors.black, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          child: GestureDetector(
                            child: DeleteButton(
                              onPressed: () => _delete(context),
                            ),
                          ),
                        )
                      ],
                    ),
                    // EditButton(
                    //   onPressed: () {
                    //     // Navigator.push(context, CreateEmployee.route(user: user)).then((success) {
                    //     //   if (success ?? false) {
                    //     //     context.read<UserQueryBloc>().add(
                    //     //           UserQueryGet(),
                    //     //         );
                    //     //   }
                    //     // });
                    //   },
                    // ),
                    // GestureDetector(
                    //   child: DeleteButton(
                    //     onPressed: () => _delete(context),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _delete(BuildContext context) {
    showDialog<bool?>(
      context: context,
      builder: (context) {
        return CardForm(
          popup: true,
          title: 'Delete',
          icon: FontAwesomeIcons.exclamationTriangle,
          actions: [
            Button(
              mini: true,
              color: const Color(0XFFD3B3AF),
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 10),
            Button(
              mini: true,
              color: const Color(0xffC89C97),
              child: const Text('Delete'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            )
          ],
          child: const Text('Are you sure you want to delete this Employee?'),
        );
      },
    )
        // Delete Api
        .then((success) {
      if (success ?? false) {
        BlocProvider.of<UsersDeleteBloc>(context).add(UsersDeleteSubmit(user));
      }
    });
    // Delete Api
  }
}


// class UserListTile extends StatelessWidget {
//   const UserListTile({
//     super.key,
//     required this.user,
//     this.onTap,
//   });

//   final Users user;
//   final void Function()? onTap;

//   void _delete(BuildContext context) {
//     showDialog<bool?>(
//       context: context,
//       builder: (context) {
//         return CardForm(
//           popup: true,
//           title: 'Delete',
//           icon: FontAwesomeIcons.exclamationTriangle,
//           actions: [
//             Button(
//               mini: true,
//               color: const Color(0XFFD3B3AF),
//               child: const Text('Cancel'),
//               onPressed: () => Navigator.pop(context),
//             ),
//             const SizedBox(width: 10),
//             Button(
//               mini: true,
//               color: const Color(0xffC89C97),
//               child: const Text('Delete'),
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//             )
//           ],
//           child: const Text('Are you sure you want to delete this item?'),
//         );
//       },
//     )
//         // Delete Api
//         .then((success) {
//       if (success ?? false) {
//         // BlocProvider.of<ProductDeleteBloc>(context).add(ProductDeleteSubmit(product));
//       }
//     });
//     // Delete Api
//   }

//   @override
//   Widget build(BuildContext context) {
//     const subTitleTextStyle = TextStyle(fontSize: 12, color: Color(0xffffffff));
//     return InkWell(
//       child: Column(
//         children: [
//           const SizedBox(height: 15),
//           Stack(
//             alignment: AlignmentDirectional.topEnd,
//             children: [
//               DecoratedBox(
//                 decoration: const BoxDecoration(
//                   color: Color(0xffffffff),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(5),
//                     topLeft: Radius.circular(5),
//                   ),
//                 ),
//                 child: Container(
//                     //   margin: const EdgeInsets.all(10),
//                     //   decoration: BoxDecoration(
//                     //     image: DecorationImage(
//                     //       image: NetworkImage(user.image),
//                     //       fit: BoxFit.fitHeight,
//                     //     ),
//                     //     borderRadius: const BorderRadius.only(
//                     //       topRight: Radius.circular(5),
//                     //       topLeft: Radius.circular(5),
//                     //     ),
//                     //     color: const Color(0xffffffff),
//                     //   ),
//                     //   height: 180,
//                     // ),
//                     ),
//                 // DotsButton(
//                 //   onDelete: () => _delete(context),
//                 //   onUpdate: () => Navigator.push(
//                 //     context,
//                 //     ProductCreateEditPage.route(
//                 //       product: product,
//                 //     ),
//                 //   ).then((success) {
//                 //     if (success ?? false) {
//                 //       context.read<ProductQueryBloc>().add(
//                 //             ProductQueryGet(),
//                 //           );
//                 //     }
//                 //   }),
//               ),
//             ],
//           ),
//           const SizedBox(height: 0),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(5),
//                     ),
//                     color: Color(0XFF713933),
//                   ),
//                   height: 35,
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: 15,
//                       top: 7,
//                     ),
//                     child: Text(
//                       user.name,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Color(0xffffffff),
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: const Color(0XFF713933),
//                 height: 35,
//               ),
//               Expanded(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(5),
//                     ),
//                     color: Color(0XFF713933),
//                   ),
//                   height: 35,
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       right: 15,
//                       top: 9,
//                     ),
//                     child: Text(
//                       user.nip,
//                       textAlign: TextAlign.end,
//                       style: subTitleTextStyle,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
