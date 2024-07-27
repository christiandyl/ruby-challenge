import { Controller } from 'stimulus';
import StimulusReflex from 'stimulus_reflex';

export default class extends Controller {
  connect() {
    StimulusReflex.register(this);

    new Cleave(this.element, {
      numericOnly: true,
      delimiters: ['-'],
      blocks: [3,2,4],
      uppercase: true,
    });
  }
}
