enum DataStatus {
  INITIAL,
  LOADING,
  ERROR,
  LOADED,
  EMPTY,
}

class Data<T> {
  T data;
  DataStatus status;

  Data(this.data, [this.status = DataStatus.INITIAL]);
}
