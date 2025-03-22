import { LightningElement , track} from 'lwc';

export default class Calculator extends LightningElement {
    number1
    number2
    @track result

    inputNumber(event){
        if(event.target.name === 'Number1')
        {
            this.number1 = event.target.value;
        }
        else if(event.target.name === 'Number2'){
            this.number2 = event.target.value;
        }
    }

    calculateResult(event){
        if(!isNaN(this.number1) && !isNaN(this.number2))
        {
            const num1 = Number(this.number1);
            const num2 = Number(this.number2);
            var tempResult=0;
            if(event.target.label === 'Add'){
                tempResult = num1 + num2;
            }
            else if(event.target.label === 'Subtract'){
                tempResult = num1 - num2;
            }
            else if(event.target.label === 'Multiply'){
                tempResult = num1 * num2;
            }
            else if(event.target.label === 'Divide'){
                tempResult = num1 / num2;
            }
            this.result = tempResult;
        }
    }
}