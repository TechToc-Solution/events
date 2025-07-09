import 'package:events/core/utils/services_locater.dart';
import 'package:events/core/widgets/custom_error_widget.dart';
import 'package:events/features/group_details/presentation/view/widget/group_detail_page_body.dart';
import 'package:events/features/group_details/presentation/view_model/get_group_details/get_group_details_cubit.dart';
import 'package:events/features/group_details/presentation/view_model/player_selection_cubit/player_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:events/core/locale/locale_cubit.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/core/utils/constats.dart';
import 'package:events/core/utils/functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupDetailPage extends StatefulWidget {
  const GroupDetailPage({super.key, required this.groupId, required this.numOfSelection, required this.groupName});
  final int groupId;
  final int numOfSelection;
  final String groupName;
  @override
  State<GroupDetailPage> createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getit.get<PlayerSelectionCubit>()..setNumOfSelection(widget.numOfSelection)),
        BlocProvider(create: (context) => getit.get<GetGroupDetailsCubit>()..getGroupDetails(widget.groupId)),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColors,
          title: Row(
            children: [
              const Icon(Icons.phone, color: Colors.white),
              const SizedBox(width: 4),
              Text("contact_us".tr(context), style: const TextStyle(fontFamily: "cocon-next-arabic")),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () async {
                final currentLocale = Localizations.localeOf(context).languageCode;
                final cubit = context.read<LocaleCubit>();
                if (currentLocale == 'en') {
                  cubit.changeLanguage('ar');
                } else {
                  cubit.changeLanguage('en');
                }
                resetHomeCubits(context);
              },
              child: Text(
                Localizations.localeOf(context).languageCode == "ar" ? "English" : "Arabic",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding, vertical: kVerticalPadding),
            child: BlocBuilder<GetGroupDetailsCubit, GetGroupDetailsState>(
              builder: (context, state) {
                if (state is GetGroupDetailsSuccess) {
                  final groupDetails = state.groups;
                  return GroupDetailsPageBoyd(
                    groupName: widget.groupName,
                    numOfSelection: widget.numOfSelection,
                    groupDetails: groupDetails,
                  );
                } else if (state is GetGroupDetailsError) {
                  return Center(
                    child: CustomErrorWidget(
                      errorMessage: state.message,
                      onRetry: () {
                        context.read<GetGroupDetailsCubit>().getGroupDetails(widget.groupId);
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
      ),
    );
  }
}
