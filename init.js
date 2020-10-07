db.disableFreeMonitoring();
rs.initiate({
  _id: "rs0",
  members: [
    {
      _id: 0,
      host: "mongo-0:27017",
      priority: 1,
    },
    {
      _id: 1,
      host: "mongo-1:27017",
      priority: 0.5,
    },
    {
      _id: 2,
      host: "mongo-2:27017",
      priority: 0.5,
    },
  ],
});
