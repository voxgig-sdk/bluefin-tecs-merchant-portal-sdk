import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputList, OutputListCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class OutputListEntity extends BluefinTecsMerchantPortalEntityBase<OutputList> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputListEntity): OutputListEntity;
    create(this: any, reqdata?: OutputListCreateData, ctrl?: Control): Promise<OutputListEntity>;
}
export { OutputListEntity };
