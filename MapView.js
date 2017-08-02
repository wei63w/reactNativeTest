//MapView.js

import React, {
    Component, 
    // ProTypes 
} from 'react';

import {requireNativeComponent} from 'react-native';

// requireNativeComponent 自动把这个组件提供给 "RNTMapManager"
var RNTMap = requireNativeComponent('RNTMap', null);     // 这里写RNTMap后，ReactNative会自动补齐为RNTMapManager，从而建立关联

export default class MapView extends Component {
  static propTypes = {
        /**
        * 当这个属性被设置为true，并且地图上绑定了一个有效的可视区域的情况下，
        * 可以通过捏放操作来改变摄像头的偏转角度。
        * 当这个属性被设置成false时，摄像头的角度会被忽略，地图会一直显示为俯视状态。
        */
        pitchEnabled: React.PropTypes.bool,

        //*** 运行流程:2/10 下面这行决定了会产生一个onChange的属性，并向外公开*/
        onChange: React.PropTypes.func,
    };

    _onChange = (event) => {
        console.log('here is onchangew');

        //*** 运行流程:10/10 在XCode调用时，按正常的OC代码调试断点就行。 VS Code调试功能目前可能有点问题。 使用命令行进行调试时，加入下面的debugger;行，运行时使用chrome的开发者模式，就会在Chrome中断住*/
        // debugger;   加上debugger运行时，就会参Chrome中看到debug有断住，然后可以进行单步运行。

        if(!this.props.onChange) {
            return;
        }

        //*** 运行流程:3/10 下面这行是触发MapView的onChange属性*/
        this.props.onChange(event.nativeEvent);
    }

    render() {
        //*** 运行流程:4/10 下面这行的目的是给OC的类RNTMap的onChangeInOC属性传递方法*/
        //*** 运行流程:5/10 注意其中...this.props， 这是继承当前类的所有属性。 这里也即是RNTMap会继承MapView的所有属性及属性值，这也是为什么RNTMap会有region,pitchEnabled,style, onChange属性的原因，
        //然后接着可以再使用其它桢属性名进行覆盖*/
        return <RNTMap {...this.props} onChangeInOC={this._onChange} />
        // return <Text />
        // return <RNTMap />
    }
}

// 下面这种方式与上面的static propTypes添加属性的方式一样。
MapView.propTypes = {
   /**
   * 地图要显示的区域。
   *
   * 区域由中心点坐标和区域范围坐标来定义。
   * 
   */
  region: React.PropTypes.shape({
    /**
     * 地图中心点的坐标。
     */
    latitude: React.PropTypes.number.isRequired,
    longitude: React.PropTypes.number.isRequired,

    /**
     * 最小/最大经、纬度间的距离。
     */
    latitudeDelta: React.PropTypes.number.isRequired,
    longitudeDelta: React.PropTypes.number.isRequired,
  }),
};

