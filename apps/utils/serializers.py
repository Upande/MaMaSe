from rest_framework.fields import SkipField
from rest_framework import serializers

from apps.utils.models import Channel, Feed


class ChannelSerializer(serializers.ModelSerializer):
    #feeds = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
    class Meta:
        model = Channel
        fields = ('id', 'data_id',
                  'name', 'description',
                  'latitude', 'longitude',
                  'created_at', 'updated_at',
                  'elevation', 'last_entry_id',
                  'username', 'type', 'river')
        depth = 1

        def to_representation(self, instance):
            """
            Object instance -> Dict of primitive datatypes.
            """
            ret = OrderedDict()
            fields = [field for field in self.fields.values() if not field.write_only]

            for field in fields:
                try:
                    attribute = field.get_attribute(instance)
                except SkipField:
                    continue

                if attribute is not None:
                    represenation = field.to_representation(attribute)
                    if represenation is "":
                        # Do not seralize empty objects
                        continue
                    if isinstance(represenation, list) and not represenation:
                        # Do not serialize empty lists
                        continue
                ret[field.field_name] = represenation

            return ret


class FeedSerializer(serializers.ModelSerializer):
    class Meta:
        model = Feed
        fields = ('id', 'entry_id', 'channel', 'added')
        depth = 1

        def to_representation(self, instance):
            """
            Object instance -> Dict of primitive datatypes.
            """
            ret = OrderedDict()
            fields = [field for field in self.fields.values() if not field.write_only]
            for field in fields:
                try:
                    attribute = field.get_attribute(instance)
                except SkipField:
                    continue

                if attribute is not None:
                    represenation = field.to_representation(attribute)
                    if not represenation:
                        # Do not seralize empty objects
                        continue
                    if isinstance(represenation, list) and not represenation:
                        # Do not serialize empty lists
                        continue
                ret[field.field_name] = represenation

            return ret
