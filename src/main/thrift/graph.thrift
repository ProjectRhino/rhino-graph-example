namespace java rhino.etl.hadoop.graph.thrift

union Item {
  1: i16 short_value;
  2: i32 int_value;
  3: i64 long_value;
  4: double double_value;
  5: string string_value;
  6: binary bytes_value;
}

struct TEdge {
    1: optional i64 leftRhinoId, // Not used in published data.
    2: optional i64 leftTitanId, // Not used in published data.
    3: optional i64 rightRhinoId,
    4: optional i64 rightTitanId, // Not used in published data.
    5: optional string label, // The type of edge.
    6: optional map<string, Item> properties
}

struct TVertex {
  1: optional i64 rhinoId, // A unique ID in the dataset for the vertex.
  2: optional i64 titanId, // Not used in published data.
  3: optional map<string, Item> properties,
  4: optional list<TEdge> outEdges,
  5: optional list<TEdge> inEdges // Not used in published data.
}

// Not used in published data.
union TEdgeOrTitanId {
  1: i64 titanId;
  2: TEdge tEdge;
}