export class Article {
  id: string;
  title: string;
  content: string;
  contentUrl: string;
  type: number;
  status: number;
  readNum: number;
  collNum: number;
  shareNum: number;
  likeNum: number;
  popular: number;
  popType?: number; // Optional for specific types
  touType?: string; // Optional for specific types
  createUser: string;
  createDate: string;
  modifyUser?: string; // Optional for updates
  modifyDate?: string; // Optional for updates
  hotelId?: string; // Optional for hotel management
  levelStar?: number; // Optional for星级酒店
  artSort?: number; // Optional for article sorting
  subtitle?: string; // Optional
  openTime?: string; // Optional
  position?: string; // Optional for location
  posDes?: string; // Optional for location description
  reserTell?: string; // Optional for reservation
  hotelLabels?: string; // Optional for hotels
  foodType?: string; // Optional for food categories
  specialProduct?: string; // Optional for specialties
  specialPrice?: string; // Optional for specialty prices
  reserType?: string; // Optional for cultural venues
  heritageType?: string; // Optional for intangible cultural heritage
  heritageTime?: string; // Optional for intangible cultural heritage
  notice?: string; // Optional for attractions
  tips?: string; // Optional for travel guides
  tickets?: string; // Optional for attraction tickets
  belongType?: string; // Optional for local specialties
  recAddr?: string; // Optional for recommended addresses
  specFrom?: string; // Optional for specialty origin
  madeBy?: string; // Optional for cultural works
  national?: string; // Optional for intangible cultural heritage level
  activityUrl?: string; // Optional for events
  activitySkip?: string; // Optional for event redirects
}

class Pagination {
  current: number;
  size: number;
}
