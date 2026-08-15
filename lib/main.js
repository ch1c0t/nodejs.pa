(function() {
  var hasProp = {}.hasOwnProperty;

  exports.f = function(first, second) {
    var fn, name, spec;
    if (first && second) {
      name = first;
      spec = second;
    } else {
      spec = first;
    }
    fn = function(input) {
      var default_value, key, out, prop, ref, state, transform, value;
      if (input == null) {
        input = {};
      }
      state = {};
      state.props = {};
      ref = spec.in;
      for (key in ref) {
        if (!hasProp.call(ref, key)) continue;
        value = ref[key];
        if (typeof value === 'function') {
          transform = value;
          if (transform.length === 0) {
            prop = transform.call(input[key]);
          } else {
            prop = transform(input[key]);
          }
        } else {
          default_value = value;
          value = input[key];
          prop = value != null ? value : default_value;
        }
        state[key] = state.props[key] = prop;
      }
      ({out} = spec);
      if (out) {
        return out.call(state);
      } else {
        return state.props;
      }
    };
    if (name) {
      return global[name] = fn;
    } else {
      return fn;
    }
  };

}).call(this);
