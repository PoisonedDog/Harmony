/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ItemData from './ItemData';

/**
 * Binds data to components and provides interfaces.
 */
export class MainViewModel {

  /**
   * Get swiper image data.
   *
   * @return {Array<Resource>} swiperImages.
   */
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
      $r('app.media.1'),
      // $r('app.media.fig2'),
      // $r('app.media.fig3'),
      // $r('app.media.fig4')
    ];
    return swiperImages;
  }

  getSwiperImagesOfPopularActivity(): Array<Resource> {
    let swiperImages: Resource[] = [
    $r('app.media.2'),
    $r('app.media.3'),
    $r('app.media.4'),
    // $r('app.media.fig4')
    ];
    return swiperImages;
  }

  /**
   * Get data of the first grid.
   *
   * @return {Array<PageResource>} firstGridData.
   */
  getFirstGridData(): Array<ItemData> {
    let firstGridData: ItemData[] = [
      new ItemData("热门景区", $r('app.media.love'),'pages/HotSceneryPage'),
      new ItemData('酒店民宿', $r('app.media.record')),
      new ItemData('地道美食', $r('app.media.message')),
      new ItemData('遂宁特产', $r('app.media.shopping')),
      new ItemData('精品路线', $r('app.media.target')),
      new ItemData('文化场馆', $r('app.media.circle')),
      new ItemData('文化遗产', $r('app.media.favorite')),
      new ItemData('文化艺术', $r('app.media.recycle')),
      new ItemData('公交信息', $r('app.media.recycle')),
      new ItemData('旅游咨询', $r('app.media.recycle')),
      new ItemData('停车场', $r('app.media.recycle')),
      new ItemData('找厕所', $r('app.media.recycle'))
    ];
    return firstGridData;
  }

  getSecondGridData(): Array<ItemData> {
    let firstGridData: ItemData[] = [
      new ItemData("test", $r('app.media.fig2')),
      new ItemData('test', $r('app.media.fig1')),
      new ItemData('test', $r('app.media.fig3')),
      new ItemData('test', $r('app.media.fig4'))
    ];
    return firstGridData;
  }

  /**
   * Get data of the setting list.
   *
   * @return {Array<PageResource>} settingListData.
   */
  getSettingListData(): Array<ItemData> {
    let settingListData: ItemData[] = [
      new ItemData('推送通知', $r('app.media.news'), '推送'),
      new ItemData('数据管理', $r('app.media.data')),
      new ItemData('菜单设置', $r('app.media.menu')),
      new ItemData('关于', $r('app.media.about')),
      new ItemData('清除缓存', $r('app.media.storage')),
      new ItemData('隐私协议', $r('app.media.privacy'))
    ];
    return settingListData;
  }
}

export default new MainViewModel();