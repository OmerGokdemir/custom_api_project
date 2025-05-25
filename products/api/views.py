from rest_framework import viewsets, filters
from django_filters.rest_framework import DjangoFilterBackend
from products.models import Product
from .serializers import ProductSerializer
from .pagination import ProductPagination
from users.api.permissions import IsAdminOrReadOnly

class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    permission_classes = [IsAdminOrReadOnly]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['available']
    search_fields = ['name', 'description']
    pagination_class = ProductPagination