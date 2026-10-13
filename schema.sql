CREATE TABLE IF NOT EXISTS rooms (
  id TEXT PRIMARY KEY,
  code TEXT NOT NULL UNIQUE,
  created_at TEXT NOT NULL,
  locked INTEGER NOT NULL DEFAULT 0,
  released INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE IF NOT EXISTS submissions (
  id TEXT PRIMARY KEY,
  room_id TEXT NOT NULL,
  name TEXT NOT NULL,
  token_hash TEXT NOT NULL,
  answers TEXT NOT NULL DEFAULT '[]',
  joined_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  FOREIGN KEY (room_id) REFERENCES rooms(id)
);
CREATE INDEX IF NOT EXISTS idx_submissions_room ON submissions(room_id);
