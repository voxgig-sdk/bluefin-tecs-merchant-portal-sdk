import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputStatus, OutputStatusLoadMatch } from '../BluefinTecsMerchantPortalTypes';
declare class OutputStatusEntity extends BluefinTecsMerchantPortalEntityBase<OutputStatus> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputStatusEntity): OutputStatusEntity;
    load(this: any, reqmatch?: OutputStatusLoadMatch, ctrl?: Control): Promise<OutputStatusEntity>;
}
export { OutputStatusEntity };
