import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class AddPostUsecase {
  final PostsRepository repository;

  AddPostUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Post post) async {
    return repository.addPost(post);
  }
}
