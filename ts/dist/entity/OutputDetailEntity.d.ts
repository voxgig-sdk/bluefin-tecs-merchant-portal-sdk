import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputDetail, OutputDetailLoadMatch } from '../BluefinTecsMerchantPortalTypes';
declare class OutputDetailEntity extends BluefinTecsMerchantPortalEntityBase<OutputDetail> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputDetailEntity): OutputDetailEntity;
    load(this: any, reqmatch?: OutputDetailLoadMatch, ctrl?: Control): Promise<OutputDetailEntity>;
}
export { OutputDetailEntity };
