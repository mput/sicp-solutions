export default class Wire {
  constructor() {
    this.value = 0;
    this.onChangeActions = [];
  }

  setValue(value) {
    if (value !== this.value) {
      this.value = value;
      this.callActions();
    }
  }

  addAction(action) {
    action();
    this.onChangeActions.push(action);
  }

  getValue() {
    return this.value;
  }

  callActions() {
    this.onChangeActions.forEach(action => action());
  }
}
