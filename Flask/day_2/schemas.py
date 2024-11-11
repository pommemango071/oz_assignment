from marshmallow import Schema, fields

class BookSchema(Schema):
    id = fields.Int(dump_only=True) # dump_only: 이 data는 서버에서 직접 관리는 할거야 라는 의미.
    title = fields.String(required=True)
    author = fields.String(required=True)