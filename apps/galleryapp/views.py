from django.shortcuts import render, get_object_or_404

from apps.galleryapp.models import Gallery, Image

#View for a gallery
def gallery_page(request, gallery_slug):
    gallery = get_object_or_404( Gallery, slug=gallery_slug)
    images = Image.objects.filter(gallery=gallery_slug).order_by('-date')
    section = gallery_slug
    return (render(request, 'gallery/gallery.html', locals()))


#View for a gallery item
def image_page(request, gallery_slug, image_slug):
    gallery = get_object_or_404(Gallery, slug=gallery_slug)  #Check for correct url
    image = get_object_or_404(Image, slug=image_slug)
    section = gallery_slug
    permalink = request.build_absolute_uri()
    return (render(request, 'gallery/image.html', locals()))
