class UserEntity {
  final String id;
  final String email;
  final String? displayName;
  

  const UserEntity({
    required this.id,
    required this.email,
    this.displayName,  
  });
}