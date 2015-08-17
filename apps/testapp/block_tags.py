# Copyright (c) 2010 by Manuel Saelices
#
# This file is part of django-playerlayer.
#
# django-playerlayer is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# django-playerlayer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with django-playerlayer.  If not, see <http://www.gnu.org/licenses/>.

from django import template
from django.conf import settings

from player.block.models import PlacedBlock


register = template.Library()


def _render_blocks(place, context):
    request = context['request']
    rendered_blocks = []
    active_blocks = PlacedBlock.objects.actives().order_by('order')

    for block in active_blocks:
        if not block.show(place, request, context):
            continue
        # append the block rendering to list
        rendered_blocks.append(block.render(request, context))

    wrapped_blocks = ['<div class="blockWrapper">%s</div>' % s for s in rendered_blocks]

    return "<div class='blockContainer'>%s" \
            "<input type=\"hidden\" class=\"blockPlace\" value=\"%s\">" \
            "</div>" \
            % ('\n'.join(wrapped_blocks), place)


class RenderBlocksNode(template.Node):

    def __init__(self, place):
        self.place = place

    def render(self, context):
        return _render_blocks(self.place, context)


@register.tag(name='render_blocks')
def do_render_blocks(parser, token):
    """
    Usage::
      {% render_blocks "leftsidebar" %}
    """
    bits = token.split_contents()
    tag_name = bits[0]
    if len(bits) != 2:
        raise template.TemplateSyntaxError('"%r" tag requires only two '
                                           'arguments' % tag_name)
    place = bits[1]
    if not (place[0] == place[-1] and place[0] in ('"', "'")):
        raise (template.TemplateSyntaxError, "%r tag's argument should be in "
                                             "quotes" % tag_name)
    return RenderBlocksNode(place[1:-1])


@register.inclusion_tag('block/header.html', takes_context=True)
def render_blocks_media(context):
    return {'request': context.get('request'),
            'STATIC_URL': settings.STATIC_URL,
            'content': context.get('content'),
            'user': context.get('user'),
            }