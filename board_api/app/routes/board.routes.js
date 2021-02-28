module.exports = app => {
  const boards = require("../controllers/board.controller.js");

  var router = require("express").Router();

  // Create a new board
  router.post("/", boards.create);

  // Retrieve all boards
  router.get("/", boards.findAll);

  // Retrieve a single board with id
  router.get("/:id", boards.findOne);

  // Update a board with id
  router.put("/:id", boards.update);

  // Delete a board with id
  router.delete("/:id", boards.delete);

  // Create a new board
  router.delete("/", boards.deleteAll);

  app.use("/api/boards", router);
};
