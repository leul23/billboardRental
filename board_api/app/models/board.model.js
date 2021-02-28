module.exports = mongoose => {
  var schema = mongoose.Schema(
    {
      id: String,
      location: String,
      price: String,
      size: String
    }
  );

  schema.method("toJSON", function() {
    const { __v, _id, ...object } = this.toObject();
    object.id = _id;
    return object;
  });

  const Board = mongoose.model("board", schema);
  return Board;
};
