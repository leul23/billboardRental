module.exports = mongoose => {
  var schema = mongoose.Schema(
    {
      boardId: String,
      boardLocation: String,
      boardPrice: String,
      boardSize: String,
      userName: String,
      status: String,
    }
  );

  schema.method("toJSON", function() {
    const { __v, _id, ...object } = this.toObject();
    object.id = _id;
    return object;
  });

  const Request = mongoose.model("request", schema);
  return Request;
};
