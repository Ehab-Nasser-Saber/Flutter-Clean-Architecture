import 'package:clean_arc_app/core/error/failures.dart';
import 'package:clean_arc_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePostUsecase {
  final PostsRepository repository;

  DeletePostUsecase(this.repository);
  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}
