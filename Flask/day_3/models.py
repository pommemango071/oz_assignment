# 모델을 만든다는 것은, 테이블을 생성하는 것이다.
# 게시글 - board
# 유저 - user

from db import db

class User(db.Model):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    boards = db.relationship('Board', back_populates='author', lazy='dynamic') 
    # 일반적으로 Foreign key라는 걸로 Board 라는 테이블에 user_id로 저장하는 것으로 그쳤다면, ORM 방식에서는 "역참조"라는 것이 있다.
    
class Board(db.Model):
    __tablename__ = "boards"

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    content = db.Column(db.String(300))
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)
    author = db.relationship('User', back_populates='boards')