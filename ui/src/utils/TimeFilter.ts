import day from 'dayjs';

const timeFilter = (str: any) => day(str).format('YYYY-MM-DD dddd');

export default timeFilter;
