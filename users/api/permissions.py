from rest_framework.permissions import BasePermission, SAFE_METHODS

class IsAdminOrReadOnly(BasePermission):
    def has_permission(self, request, view):
        return bool(request.method in SAFE_METHODS or request.user.is_staff)


class IsSuperAdminUser(BasePermission):

    def has_permission(self, request, view):
        return bool(request.user and request.user.is_superuser)