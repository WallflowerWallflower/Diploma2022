import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { BehaviorSubject, filter, find, map, of } from 'rxjs';
import { RequestService } from 'src/app/request.service';

export type DoctorType = {
  fullname: string;
  class: string; // type of doctor
  email: string;
  address?: {
    longitude: string;
    latitude: string;
  };
  rating: number;
  profileImgUrl?: string;
  additionalInfo: {
    about?: string;
    qualifications?: string[];
    services?: string[];
    reviews: ReviewType[];
    fees?: any;
  };
};

export type ReviewType = {
  username: string;
  comment: string;
  datePublish: Date;
};

@Component({
  selector: 'app-service-page',
  templateUrl: './service-page.component.html',
  styleUrls: ['./service-page.component.css'],
})
export class ServicePageComponent implements OnInit {

  public rating: any;
  public increase: any;
  public decrease: any;
  
  public dataSelect$: BehaviorSubject<any> = new BehaviorSubject<any>([]);

  dataCard: any = [];
  index: any = this.dataCard.index;
  cardDetails: any = [];

  constructor(private reqService: RequestService) {}

  ngOnInit(): void {
    this.reqService.getUsers().subscribe((data: any) => {
      this.dataCard = data;
    });

  }

  sortByAZ(value: any) {
    switch(value) {
      case "rating":
        console.log(value)
        break
      case "increase":
        console.log(value)
        break
      case "decrease":
        console.log(value)
        break
      default:
        return value
    }
  }

  onSelect(id: number) {
    this.reqService.getUsers().pipe(
      map((item) => {
        let ids: any = [];
        item.map((el: any) => {
          if(el.id === id) {
            ids.push(el)
          }
        })
        return ids;
      }),
    ).subscribe(data => this.cardDetails = data);
  }
}
