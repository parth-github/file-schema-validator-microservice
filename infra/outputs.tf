# Outputs
output "ecs_task_definition_arn" {
  value = aws_ecs_service.fastapi_service.id
}
output "ecs_cluster_name" {
  value = aws_ecs_cluster.fastapi_cluster.name
}