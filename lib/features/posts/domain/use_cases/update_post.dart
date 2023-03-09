import 'package:clean_arc_app/core/error/failures.dart';
import 'package:clean_arc_app/features/posts/domain/entities/post.dart';
import 'package:clean_arc_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUsecase {
  final PostsRepository repository;

  UpdatePostUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
