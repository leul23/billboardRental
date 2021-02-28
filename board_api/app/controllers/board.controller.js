const db = require("../models");
const Board = db.boards;

// Create and Save a new Board
exports.create = (req, res) => {
  // Validate request
  if (!req.body.id) {
    res.status(400).send({ message: "Content can not be empty!" });
    return;
  }

  // Create a Board
  const board = new Board({
    id: req.body.id,
    location: req.body.location,
    price: req.body.price, 
    size: req.body.size
  });

  // Save Board in the database
  board
    .save(board)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Board."
      });
    });
};

// Retrieve all Boards from the database.
exports.findAll = (req, res) => {
  const id = req.query.id;
  var condition = id ? { id: { $regex: new RegExp(id), $options: "i" } } : {};

  Board.find(condition)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving boards."
      });
    });
};

// Find a single Board with an id
exports.findOne = (req, res) => {
  const id = req.params.id;

  Board.findById(id)
    .then(data => {
      if (!data)
        res.status(404).send({ message: "Not found Board with id " + id });
      else res.send(data);
    })
    .catch(err => {
      res
        .status(500)
        .send({ message: "Error retrieving Board with id=" + id });
    });
};

// Update a Board by the id in the request
exports.update = (req, res) => {
  if (!req.body) {
    return res.status(400).send({
      message: "Data to update can not be empty!"
    });
  }

  const id = req.params.id;

  Board.findByIdAndUpdate(id, req.body, { useFindAndModify: false })
    .then(data => {
      if (!data) {
        res.status(404).send({
          message: `Cannot update Board with id=${id}. Maybe Board was not found!`
        });
      } else res.send({ message: "Board was updated successfully." });
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating Board with id=" + id
      });
    });
};

// Delete a Board with the specified id in the request
exports.delete = (req, res) => {
  const id = req.params.id;

  Board.findByIdAndRemove(id, { useFindAndModify: false })
    .then(data => {
      if (!data) {
        res.status(404).send({
          message: `Cannot delete Board with id=${id}. Maybe Board was not found!`
        });
      } else {
        res.send({
          message: "Board was deleted successfully!"
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Could not delete Board with id=" + id
      });
    });
};

// Delete all Boards from the database.
exports.deleteAll = (req, res) => {
  Board.deleteMany({})
    .then(data => {
      res.send({
        message: `${data.deletedCount} Boards were deleted successfully!`
      });
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while removing all boards."
      });
    });
};

