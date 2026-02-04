import { LightningElement , wire} from 'lwc';
import getMovies from '@salesforce/apex/IMDBData.getMovies';
export default class HttpLWCParent extends LightningElement {
    enteredText ='';
    searchText = '';
    showText='Please Enter Movie Name';
    movies = [];
    handleChange(event){
        this.enteredText = event.target.value;
    }
    handleClick(event){
        this.searchText = this.enteredText;
    }
    @wire(getMovies, {searchText : '$searchText'})
    fetchMovies(result){
        if(result.data){
            let data = JSON.parse(result.data);
            if(data.success){
                this.movies = data.result;
                this.showText = '';
            }
            else{
                this.movies=[];
                this.showText = 'Please Enter Valid Movie Name';
            }
        }
        else if(result.error){
            console.log('Error occured while Searching movies: '+ result.error);
            this.showText='Error occured while Searching movies: '+ result.error;
        }
    }
}