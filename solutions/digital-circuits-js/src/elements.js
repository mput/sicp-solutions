function addOrGate(timeTable) {
  return (input1, input2, output) => {
    const delay = 5;
    const getLogicalOr = (a, b) => (a || b ? 1 : 0);

    const action = () => {
      const newOutputValue = getLogicalOr(input1.getValue(), input2.getValue());
      timeTable.addDelayedAction(delay, () => output.setValue(newOutputValue));
    };
    input1.addAction(action);
    input2.addAction(action);
  };
}

function addAndGate(timeTable) {
  return (input1, input2, output) => {
    const delay = 3;
    const getLogicalOr = (a, b) => (a && b ? 1 : 0);

    const action = () => {
      const newOutputValue = getLogicalOr(input1.getValue(), input2.getValue());
      timeTable.addDelayedAction(delay, () => output.setValue(newOutputValue));
    };
    input1.addAction(action);
    input2.addAction(action);
  };
}

function addInverter(timeTable) {
  return (input, output) => {
    const delay = 2;
    const getInverted = val => (val === 0 ? 1 : 0);
    const action = () => {
      const newValue = getInverted(input.getValue());
      timeTable.addDelayedAction(delay, () => output.setValue(newValue));
    };
    input.addAction(action);
  };
}


export default { addOrGate, addAndGate, addInverter };
