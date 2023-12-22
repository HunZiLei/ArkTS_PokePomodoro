export class TabModel {
  id: number
  name: string
  tabType: string

  constructor(id: number, name: string, tabType: string) {
    this.id = id;
    this.name = name;
    this.tabType = tabType;
  }
}

export function getTabList(): Array<TabModel> {
  return [
    { id: 0, name: '国内', tabType: 'guonei' }, { id: 1, name: '国际', tabType: 'guoji' },
    { id: 2, name: '娱乐', tabType: 'yule' }, { id: 3, name: '时尚', tabType: 'shishang' },
    { id: 4, name: '游戏', tabType: 'youxi' }, { id: 5, name: '科技', tabType: 'keji' },
    { id: 6, name: '财经', tabType: 'caijing' }
  ]
}