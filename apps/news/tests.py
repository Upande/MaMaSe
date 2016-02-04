from django.test import TestCase

# Create your tests here.
from apps.news.models import *

class CategoryTestCase(TestCase):
    def setUp(self):
        CategoryPage.objects.create(name="categ1", description="desc1")
        CategoryPage.objects.create(name="categ2", description="desc2")

    def test_search_category_page(self):
        """Test if you can get a category"""
        categ1 = CategoryPage.objects.get(name="categ1")
        categ2 = CategoryPage.objects.get(name="categ2")
        self.assertEqual(categ1.search('categ1'), categ1[0])
        self.assertEqual(categ2.search('categ2'), categ2[0])
