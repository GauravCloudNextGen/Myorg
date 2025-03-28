import { LightningElement , api } from 'lwc';

export default class ApiDecorator extends LightningElement {
    @api inputMessage = 'World';

    handleChange(event){
        console.log('Value ' + event.target.value);
        this.inputMessage = event.target.value;
    }
}