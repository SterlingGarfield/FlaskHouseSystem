// 柱状图配色方案
const barColors = {
    // 主色调
    primary: '#FF6B6B',
    // 渐变色系列
    gradient: [
        '#FF6B6B', // 鲜红色
        '#4ECDC4', // 青绿色
        '#45B7D1', // 天蓝色
        '#96CEB4', // 薄荷绿
        '#FFEEAD', // 淡黄色
        '#D4A5A5', // 玫瑰粉
        '#9B59B6', // 紫色
        '#3498DB', // 蓝色
        '#E67E22', // 橙色
        '#2ECC71'  // 绿色
    ],
    // 文字颜色
    text: '#000',
    // 坐标轴颜色
    axis: {
        line: '#fff',
        label: '#fff',
        splitLine: 'rgba(255, 255, 255, 0.1)'
    },
    // 强调状态
    emphasis: {
        itemStyle: {
            shadowBlur: 10,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
    },
    // 柱状图样式
    itemStyle: {
        borderRadius: [4, 4, 0, 0]
    }
};
