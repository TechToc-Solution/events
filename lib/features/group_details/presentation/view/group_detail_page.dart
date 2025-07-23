import 'package:events/core/utils/services_locater.dart';
import 'package:events/core/widgets/custom_error_widget.dart';
import 'package:events/features/group_details/presentation/view/widget/group_detail_page_body.dart';
import 'package:events/features/group_details/presentation/view_model/get_group_details/get_group_details_cubit.dart';
import 'package:events/features/group_details/presentation/view_model/player_selection_cubit/player_selection_cubit.dart';
import 'package:events/features/home/data/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/core/utils/constats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupDetailPage extends StatefulWidget {
  const GroupDetailPage({super.key, required this.group});
  final GroupData group;

  @override
  State<GroupDetailPage> createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getit.get<PlayerSelectionCubit>()
                ..setNumOfSelection(widget.group.countSelect ?? 0),
        ),
        BlocProvider(
          create: (context) =>
              getit.get<GetGroupDetailsCubit>()
                ..getGroupDetails(widget.group.id ?? 0),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColors,
          elevation: 2,
          // title: Row(
          //   children: [
          //     const Icon(Icons.phone, color: Colors.white),
          //     const SizedBox(width: 8),
          //     Text(
          //       "contact_us".tr(context),
          //       style: const TextStyle(
          //         fontFamily: "cocon-next-arabic",
          //         fontSize: 20,
          //         color: Colors.white,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ],
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: BlocBuilder<GetGroupDetailsCubit, GetGroupDetailsState>(
            builder: (context, state) {
              if (state is GetGroupDetailsSuccess) {
                final groupDetails = state.groups;
                return GroupDetailsPageBody(
                  group: widget.group,
                  groupDetails: groupDetails,
                );
              } else if (state is GetGroupDetailsError) {
                return Center(
                  child: CustomErrorWidget(
                    errorMessage: state.message,
                    onRetry: () {
                      context.read<GetGroupDetailsCubit>().getGroupDetails(
                        widget.group.id ?? 0,
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
