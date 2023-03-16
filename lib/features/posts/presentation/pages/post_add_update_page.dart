import 'package:clean_arc_app/core/util/snackbar_message.dart';
import 'package:clean_arc_app/core/widgets/loading_widget.dart';
import 'package:clean_arc_app/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post.dart';
import '../bloc/add_delete_update_post/add_delete_update_post_bloc.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;

  const PostAddUpdatePage({super.key, this.post, required this.isUpdatePost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(title: Text(isUpdatePost ? 'Edit Post' : 'Add Post'));
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdatePostState) {
              SnackBarMessage().showSuccessSnackBar(
                  message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => PostsPage()),
                  (route) => false);
            } else if (state is ErrorAddDeleteUpdatePostState) {
              SnackBarMessage()
                  .showErrorSnackBar(message: state.message, context: context);

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => PostsPage()),
                  (route) => false);
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdatePostState) {
              return LoadingWidget();
            }
            return SizedBox();
            // FormWidget(
            //     isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
          },
        ),
      ),
    );
  }
}
